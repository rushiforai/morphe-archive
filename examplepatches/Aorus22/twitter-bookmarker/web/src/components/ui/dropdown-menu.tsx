import * as React from "react"
import { cn } from "cn"
import { DropdownMenu as DropdownMenuPrimitive } from "radix-ui"
import { CheckIcon } from "lucide-react"

import type { PortalContainer } from "@/components/ui/dialog"

/**
 * A menu that never claims the rest of the page is hidden.
 *
 * Radix's `modal` default makes the menu `aria-hidden` everything outside itself
 * — for a menu portalled to `document.body` that is the entire app — while
 * leaving those elements focusable. Axe reports it as a serious
 * `aria-hidden-focus` violation, and it is worse than noise: a screen reader is
 * told the page is gone while Tab still walks through it. `modal={false}` also
 * drops the menu's own focus trap and outside-pointer blocking, which is the
 * right behaviour for a menu on a card — it is not a modal dialog, and when one
 * is opened inside the media lightbox the lightbox's own dialog already provides
 * the trap. Focus still moves into the menu and returns to the trigger on close,
 * and Escape and an outside click still dismiss it.
 */
function DropdownMenu({
  ...props
}: React.ComponentProps<typeof DropdownMenuPrimitive.Root>) {
  return (
    <DropdownMenuPrimitive.Root
      data-slot="dropdown-menu"
      modal={false}
      {...props}
    />
  )
}

function DropdownMenuTrigger({
  ...props
}: React.ComponentProps<typeof DropdownMenuPrimitive.Trigger>) {
  return (
    <DropdownMenuPrimitive.Trigger
      data-slot="dropdown-menu-trigger"
      {...props}
    />
  )
}

function DropdownMenuContent({
  className,
  align = "end",
  sideOffset = 4,
  portalContainer,
  ...props
}: React.ComponentProps<typeof DropdownMenuPrimitive.Content> & {
  /**
   * Portal target. Radix mounts to `document.body` by default, which would put
   * this menu outside the media lightbox's focus trap — pass the lightbox
   * content element instead when the menu is opened from inside it.
   */
  portalContainer?: PortalContainer
}) {
  return (
    <DropdownMenuPrimitive.Portal container={portalContainer}>
      <DropdownMenuPrimitive.Content
        data-slot="dropdown-menu-content"
        align={align}
        sideOffset={sideOffset}
        className={cn(
          "z-50 min-w-44 origin-(--radix-dropdown-menu-content-transform-origin) overflow-hidden rounded-lg bg-popover p-1 text-sm text-popover-foreground shadow-md ring-1 ring-foreground/10 outline-hidden duration-100 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 data-open:animate-in data-open:fade-in-0 data-open:zoom-in-95 data-closed:animate-out data-closed:fade-out-0 data-closed:zoom-out-95",
          className
        )}
        {...props}
      />
    </DropdownMenuPrimitive.Portal>
  )
}

function DropdownMenuItem({
  className,
  variant = "default",
  ...props
}: React.ComponentProps<typeof DropdownMenuPrimitive.Item> & {
  /** `destructive` tints the row for an action that changes data irreversibly. */
  variant?: "default" | "destructive"
}) {
  return (
    <DropdownMenuPrimitive.Item
      data-slot="dropdown-menu-item"
      data-variant={variant}
      className={cn(
        "relative flex cursor-default items-center gap-2 rounded-md px-2 py-1.5 outline-hidden select-none focus:bg-surface-warm focus:text-foreground data-disabled:pointer-events-none data-disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:shrink-0 [&_svg:not([class*='size-'])]:size-4",
        variant === "destructive" && "text-destructive focus:text-destructive",
        className
      )}
      {...props}
    />
  )
}

function DropdownMenuRadioGroup({
  ...props
}: React.ComponentProps<typeof DropdownMenuPrimitive.RadioGroup>) {
  return (
    <DropdownMenuPrimitive.RadioGroup
      data-slot="dropdown-menu-radio-group"
      {...props}
    />
  )
}

/**
 * One choice in an exclusive set.
 *
 * This is the control to reach for when a "select" is wanted but the OS-drawn
 * `<select>` popup cannot be themed: `menuitemradio` is the ARIA pattern for
 * choosing one of a small fixed set, and it inherits this wrapper's
 * `modal={false}`, so it does not hide the rest of the page from assistive
 * technology the way a modal menu (or Radix's `Select`) does.
 */
function DropdownMenuRadioItem({
  className,
  children,
  ...props
}: React.ComponentProps<typeof DropdownMenuPrimitive.RadioItem>) {
  return (
    <DropdownMenuPrimitive.RadioItem
      data-slot="dropdown-menu-radio-item"
      className={cn(
        "relative flex cursor-default items-center gap-2 rounded-md py-1.5 pr-8 pl-2 outline-hidden select-none focus:bg-surface-warm focus:text-foreground data-disabled:pointer-events-none data-disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:shrink-0 [&_svg:not([class*='size-'])]:size-4",
        className
      )}
      {...props}
    >
      {/* `pr-8` above reserves this gutter so a label never runs under the check. */}
      <span className="pointer-events-none absolute right-2 flex size-4 items-center justify-center">
        <DropdownMenuPrimitive.ItemIndicator>
          <CheckIcon />
        </DropdownMenuPrimitive.ItemIndicator>
      </span>
      {children}
    </DropdownMenuPrimitive.RadioItem>
  )
}

function DropdownMenuSeparator({
  className,
  ...props
}: React.ComponentProps<typeof DropdownMenuPrimitive.Separator>) {
  return (
    <DropdownMenuPrimitive.Separator
      data-slot="dropdown-menu-separator"
      className={cn("-mx-1 my-1 h-px bg-border", className)}
      {...props}
    />
  )
}

function DropdownMenuLabel({
  className,
  ...props
}: React.ComponentProps<typeof DropdownMenuPrimitive.Label>) {
  return (
    <DropdownMenuPrimitive.Label
      data-slot="dropdown-menu-label"
      className={cn("px-2 py-1.5 text-xs text-muted-foreground", className)}
      {...props}
    />
  )
}

export {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuRadioGroup,
  DropdownMenuRadioItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
}
