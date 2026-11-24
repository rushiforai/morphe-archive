# Apple Music — albums d’un artiste dans Android Auto

## 1. Meta

- Statut : approuvée.
- APKM fourni : Apple Music Android `7.0.1` (`1622`), package `com.apple.android.music`.

## 2. Contexte

Dans **Bibliothèque → Artistes**, sélectionner un artiste lance la lecture aléatoire de ses titres. L’utilisateur veut choisir un album sans interrompre la lecture en cours.

## 3. Objectif

Afficher les albums de l’artiste présents dans la bibliothèque. La sélection d’un album ouvre la liste de ses titres. La première ligne, « Jouer l’album », porte une icône de lecture et lance l’album via le lecteur existant. Un appui sur un titre lance ce titre.

## 4. Hors périmètre

Interface du téléphone, recherche dans le catalogue Apple Music, synchronisation de la bibliothèque, connexion, abonnement et contrôles de lecture.

## 5. Périmètre

Le changement s’applique à **Bibliothèque → Artistes** dans Android Auto. Les autres sections et les commandes de lecture existantes conservent leur comportement. Si l’artiste n’a aucun album correspondant, la vue reste vide ou utilise l’état vide existant.

## 6. Risques et impacts

- Les identifiants d’artistes et d’albums doivent rester compatibles avec la navigation existante.
- La longueur des listes et l’interface sont contrôlées par Android Auto.
- Le test de bout en bout nécessite une session Apple Music active sur l’appareil de test et une connexion au Desktop Head Unit. Les identifiants restent saisis par l’utilisateur dans l’app, si nécessaire.

## 7. Approche

Rendre l’artiste et l’album navigables via le service média. Réutiliser les requêtes d’Apple Music pour les albums et les titres. Présenter les titres en liste sans pochettes individuelles. Utiliser la commande de lecture d’album existante pour la première ligne, avec un libellé français et anglais.

## 8. Alternative

Afficher toute la discographie irait au-delà de la bibliothèque et nécessiterait un parcours catalogue.

## 9. Implémentation

Après approbation, vérifier les points d’injection, créer un patch distinct dans le bundle Morphe et valider son application sur l’APKM original.

## 10. Test local

Dans le Desktop Head Unit, comparer l’APK originale et l’APK patchée. Utiliser un artiste avec au moins deux albums et lancer un titre avant d’ouvrir le menu Artistes pour observer si la navigation perturbe la lecture.

## 11. Critères d’acceptation

- AC-1 — Choisir un artiste affiche ses albums de bibliothèque sans lancer de lecture aléatoire.
- AC-2 — Choisir un album ouvre ses titres en liste. La première ligne « Jouer l’album » porte une icône de lecture et lance l’album. Choisir un titre lance ce titre.
- AC-3 — La lecture en cours continue pendant la navigation, y compris au retour vers la liste des artistes. Elle change quand on sélectionne un titre ou « Jouer l’album ».
- AC-4 — Un artiste sans album correspondant ne lance aucune lecture. Les autres sections de la bibliothèque restent accessibles.
- AC-5 — La séquence est vérifiée localement dans Android Auto avec le Desktop Head Unit.
