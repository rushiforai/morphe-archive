/**
 * Playing a move: building the request exactly like the app ({@code MoveRequest}), sending it with the app's
 * session cookie ({@code SessionReader}, {@code MoveSubmitter}) and making Wordfeud refresh the board afterwards
 * ({@code Refresher}; the working strategy is {@code LifecycleBounce}).
 *
 * <p>Wordfeud dependency: the move API ({@code POST /wf/game/<id>/move/}), the cookie file kept by the Dart
 * cookie_jar package and {@code FlutterJNI.dispatchPlatformMessage} (called by reflection, {@code JniDispatch}).
 */
package app.wordfeudwordfinder.extension.play;
