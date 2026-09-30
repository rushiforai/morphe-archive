import { createBrowserRouter } from "react-router-dom"

import { AppShell } from "@/app/app-shell"
import { CollectionPage } from "@/pages/collection-page"
import { GalleryPage } from "@/pages/gallery-page"
import { NotFoundPage } from "@/pages/not-found-page"

/**
 * Route table (PRD-2 §15).
 *
 *   /                        → gallery homepage   (Phase 4 fills the body)
 *   /collections/:slug       → collection detail  (Phase 5 fills the body)
 *   *                        → not found
 *
 * Every route renders inside {@link AppShell}, so the nav and the theme toggle
 * persist across client-side navigations (no full page reload).
 */
export const router = createBrowserRouter([
  {
    path: "/",
    element: <AppShell />,
    children: [
      { index: true, element: <GalleryPage /> },
      { path: "collections/:slug", element: <CollectionPage /> },
      { path: "*", element: <NotFoundPage /> },
    ],
  },
])
