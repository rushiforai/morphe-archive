import { screen } from "@testing-library/react"
import type { UserEvent } from "@testing-library/user-event"

/**
 * Shared interactions for tests that drive real controls end to end.
 *
 * These exist because some controls are primitives rather than form elements,
 * and the difference is not cosmetic — it changes how a test has to reach them.
 */

/**
 * Choose a sort mode through the collection toolbar's sort control.
 *
 * It is a Radix menu of `menuitemradio`s, not a native `<select>`, so neither
 * `selectOptions` nor `fireEvent.change` can drive it: Radix opens on
 * `pointerdown` only when `event.button === 0 && event.ctrlKey === false`, and
 * `fireEvent` cannot express that in jsdom (which has no `PointerEvent`, so the
 * fields are dropped and the trigger never opens). A real `userEvent` click on
 * the trigger and then on the item is what the browser does, so that is what
 * the tests do.
 */
export async function chooseSort(
  user: UserEvent,
  label: string
): Promise<void> {
  await user.click(screen.getByTestId("collection-sort"))
  await user.click(screen.getByRole("menuitemradio", { name: label }))
}
