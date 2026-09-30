/**
 * Popup — Categories section (PRD §43, §45–§49, §62).
 *
 * Rendering plus handlers for add, inline rename, colour, delete, and
 * drag-and-drop reorder. Every mutation goes through `shared/storage.ts`, which
 * only writes `chrome.storage.local`: no category operation ever performs a
 * backend request. Removing a category here only removes it from the popup's
 * list; the bookmarks it grouped stay in the database untouched.
 */

import { CATEGORY_COLOR_PALETTE, DEFAULT_CATEGORY_COLOR } from "../shared/constants.ts";
import {
  addCategory,
  deleteCategory,
  reorderCategories,
  updateCategoryColor,
  updateCategoryName,
} from "../shared/storage.ts";
import type { Category, Store } from "../shared/types.ts";

export interface CategoryManager {
  /** Render the list for a normalized store. */
  render(store: Store): void;
}

/** Exact delete confirmation copy required by PRD §48. */
export function deleteConfirmationText(name: string): string {
  return `Delete category "${name}"?\n\nExisting bookmarks will not be deleted.`;
}

function requireEl<T extends Element>(id: string): T {
  const element = document.getElementById(id);
  if (element === null) throw new Error(`popup markup is missing #${id}`);
  return element as unknown as T;
}

function messageOf(error: unknown): string {
  return error instanceof Error && error.message.length > 0 ? error.message : "Something went wrong";
}

export function initCategoryManager(): CategoryManager {
  const list = requireEl<HTMLUListElement>("category-list");
  const empty = requireEl<HTMLParagraphElement>("categories-empty");
  const countEl = requireEl<HTMLSpanElement>("categories-count");
  const errorEl = requireEl<HTMLParagraphElement>("category-error");
  const form = requireEl<HTMLFormElement>("add-category-form");
  const toggle = requireEl<HTMLButtonElement>("add-category-toggle");
  const nameInput = requireEl<HTMLInputElement>("add-category-name");
  const colorInput = requireEl<HTMLInputElement>("add-category-color");
  const cancelButton = requireEl<HTMLButtonElement>("add-category-cancel");
  const template = requireEl<HTMLTemplateElement>("category-row-template");

  /** Non-null while an inline rename input is open; blocks list rebuilds that would clobber it. */
  let activeRenameId: string | null = null;
  /** The row currently being dragged, if any. */
  let draggingRow: HTMLLIElement | null = null;
  /** Last rendered store order, used to skip no-op reorder writes. */
  let lastOrder: string[] = [];

  function showError(message: string): void {
    errorEl.textContent = message;
    errorEl.hidden = false;
  }

  function clearError(): void {
    errorEl.textContent = "";
    errorEl.hidden = true;
  }

  function openAddForm(): void {
    clearError();
    form.hidden = false;
    toggle.hidden = true;
    if (colorInput.value === "") colorInput.value = DEFAULT_CATEGORY_COLOR;
    nameInput.value = "";
    nameInput.focus();
  }

  function closeAddForm(): void {
    form.hidden = true;
    toggle.hidden = false;
    nameInput.value = "";
  }

  function startRename(row: HTMLLIElement, category: Category): void {
    const nameEl = row.querySelector<HTMLSpanElement>(".category-name");
    const inputEl = row.querySelector<HTMLInputElement>(".category-name-input");
    if (!nameEl || !inputEl) return;

    activeRenameId = category.id;
    nameEl.hidden = true;
    inputEl.hidden = false;
    inputEl.value = category.name;
    inputEl.focus();
    inputEl.select();

    let settled = false;
    const finish = (commit: boolean): void => {
      if (settled) return;
      settled = true;
      activeRenameId = null;
      inputEl.hidden = true;
      nameEl.hidden = false;

      const value = inputEl.value.trim();
      if (!commit || value.length === 0 || value === category.name) return;

      void updateCategoryName(category.id, value)
        .then(() => clearError())
        .catch((error: unknown) => showError(messageOf(error)));
    };

    inputEl.addEventListener("keydown", (event) => {
      if (event.key === "Enter") {
        event.preventDefault();
        finish(true);
      } else if (event.key === "Escape") {
        event.preventDefault();
        finish(false);
      }
    });
    inputEl.addEventListener("blur", () => finish(true), { once: true });
  }

  function renderRow(category: Category): HTMLLIElement {
    const fragment = template.content.cloneNode(true) as DocumentFragment;
    const row = fragment.firstElementChild as HTMLLIElement | null;
    if (row === null) throw new Error("category row template is empty");

    row.dataset.categoryId = category.id;
    row.draggable = true;
    row.classList.add("category-row");

    const colorEl = row.querySelector<HTMLInputElement>(".category-color");
    const nameEl = row.querySelector<HTMLSpanElement>(".category-name");
    const slugEl = row.querySelector<HTMLSpanElement>(".category-slug");
    const renameButton = row.querySelector<HTMLButtonElement>(".category-rename");
    const deleteButton = row.querySelector<HTMLButtonElement>(".category-delete");

    if (colorEl) {
      colorEl.value = category.color;
      colorEl.setAttribute("aria-label", `Color for ${category.name}`);
      colorEl.addEventListener("change", () => {
        void updateCategoryColor(category.id, colorEl.value)
          .then(() => clearError())
          .catch((error: unknown) => showError(messageOf(error)));
      });
    }

    if (nameEl) nameEl.textContent = category.name;
    if (slugEl) {
      slugEl.textContent = `\u2192 ${category.slug}`;
      slugEl.title = category.slug;
    }

    if (renameButton) {
      renameButton.setAttribute("aria-label", `Rename ${category.name}`);
      renameButton.addEventListener("click", () => startRename(row, category));
    }

    if (deleteButton) {
      deleteButton.setAttribute("aria-label", `Delete ${category.name}`);
      deleteButton.addEventListener("click", () => {
        if (!window.confirm(deleteConfirmationText(category.name))) return;
        void deleteCategory(category.id)
          .then(() => clearError())
          .catch((error: unknown) => showError(messageOf(error)));
      });
    }

    row.addEventListener("dragstart", (event) => {
      draggingRow = row;
      row.classList.add("dragging");
      event.dataTransfer?.setData("text/plain", category.id);
      if (event.dataTransfer) event.dataTransfer.effectAllowed = "move";
    });

    row.addEventListener("dragover", (event) => {
      if (draggingRow === null || draggingRow === row) return;
      event.preventDefault();
      if (event.dataTransfer) event.dataTransfer.dropEffect = "move";
      const rect = row.getBoundingClientRect();
      const insertAfter = event.clientY > rect.top + rect.height / 2;
      list.insertBefore(draggingRow, insertAfter ? row.nextElementSibling : row);
    });

    row.addEventListener("dragend", () => {
      row.classList.remove("dragging");
      draggingRow = null;
      void persistOrderFromDom();
    });

    return row;
  }

  /** Read the current DOM order and persist it (no-op when unchanged). */
  async function persistOrderFromDom(): Promise<void> {
    const ids = Array.from(list.querySelectorAll<HTMLLIElement>(".category-row"))
      .map((row) => row.dataset.categoryId ?? "")
      .filter((id) => id.length > 0);

    if (ids.length !== lastOrder.length) return;
    if (ids.join("\u0000") === lastOrder.join("\u0000")) return;

    try {
      await reorderCategories(ids);
      clearError();
    } catch (error) {
      showError(messageOf(error));
    }
  }

  toggle.addEventListener("click", openAddForm);
  cancelButton.addEventListener("click", closeAddForm);

  form.addEventListener("submit", (event) => {
    event.preventDefault();
    const name = nameInput.value.trim();
    if (name.length === 0) {
      showError("Category name is required");
      nameInput.focus();
      return;
    }
    void addCategory({ name, color: colorInput.value })
      .then(() => {
        closeAddForm();
        clearError();
      })
      .catch((error: unknown) => showError(messageOf(error)));
  });

  // Populate the add form's colour picker from the shared palette's first entry.
  colorInput.value = CATEGORY_COLOR_PALETTE[0] ?? DEFAULT_CATEGORY_COLOR;

  function render(store: Store): void {
    lastOrder = store.categories.map((category) => category.id);
    empty.hidden = store.categories.length > 0;

    // The chip mirrors the gallery's "4 collections" count. `aria-label` carries
    // the unit, since the visible text is the bare number.
    const total = store.categories.length;
    countEl.textContent = String(total);
    countEl.setAttribute("aria-label", `${total} ${total === 1 ? "category" : "categories"}`);

    // Never destroy an open rename input on an unrelated storage change.
    if (activeRenameId !== null) return;

    list.replaceChildren(...store.categories.map(renderRow));
  }

  return { render };
}
