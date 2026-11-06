/**
 * Shared basics: the {@link app.wordfeudwordfinder.extension.core.WordFinder} singleton that wires everything
 * together, error codes ({@link app.wordfeudwordfinder.extension.core.WfError}, shown with "Copy details"), the
 * patch's private file storage, the build version and {@link app.wordfeudwordfinder.extension.core.Tiles} (digraph
 * tiles such as Spanish CH).
 *
 * <p>Wordfeud dependency: the app's files directory (found via {@code ActivityThread.currentApplication()}).
 */
package app.wordfeudwordfinder.extension.core;
