# Spec: Remplacer Google Photos par Immich dans Pixel Camera

## Statut

Approuvée.

## Objectif

Ajouter dans la section `General` de Pixel Camera un toggle localisé :
`Replace Google Photos with Immich`.

Le toggle est désactivé par défaut. Lorsqu’il est activé, le clic sur la miniature de la dernière photo ouvre explicitement Immich. Lorsqu’il est désactivé, le comportement original de Pixel Camera est conservé, y compris Google Photos.

## Périmètre

- Ajouter un unique toggle dans `General`.
- Utiliser le package Immich en dur : `app.alextran.immich`.
- Remplacer explicitement le package Google Photos uniquement lorsque le toggle est activé.
- Préserver l’URI, le type MIME, les flags et les extras du flux de revue Pixel Camera.
- Ajouter les chaînes dans les ressources Android pour permettre l’internationalisation.
- Rester compatible avec l’injection de réglages d’Akshayykadam/Pixel-Camera.

## Hors périmètre

- Aucun picker ou resolver Android.
- Aucun choix au premier clic.
- Aucun choix d’application dans les settings.
- Aucun champ package libre.
- Aucun support générique d’autres galeries.
- Aucun support Cloud Media Provider spécifique.
- Aucun changement du comportement lorsque le toggle est désactivé.

## Comportement attendu

1. Toggle désactivé : l’intent original est inchangé.
2. Toggle activé : l’intent final est dirigé explicitement vers `app.alextran.immich`.
3. Si Immich est absent ou ne peut pas traiter l’intent, Pixel Camera ne doit pas planter ; le comportement doit revenir à l’intent original ou afficher une erreur contrôlée selon ce que permet le point d’injection.
4. Le toggle doit être désactivé par défaut et persister via les préférences Android de Pixel Camera.
5. Le parcours de revue sécurisé de Pixel Camera s’applique lorsque l’écran est verrouillé.

## Critères d’acceptation

- AC-1 : un seul toggle `Replace Google Photos with Immich` apparaît dans `General`.
- AC-2 : le toggle est désactivé par défaut.
- AC-3 : désactivé, le clic sur la miniature conserve le comportement Google Photos original.
- AC-4 : activé, le clic sur la miniature cible explicitement `app.alextran.immich`.
- AC-5 : aucun sélecteur d’activité ou d’application n’est ouvert.
- AC-6 : les chaînes sont localisables via les ressources Android.
- AC-7 : le patch est validé par Morphe sur l’APKM Pixel Camera 11.1.040.982810059.19.
