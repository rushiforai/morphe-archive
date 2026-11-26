package nl.johninnl.soundcloud;

import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** Translates only known UI labels in section metadata, never track/user entities. */
public final class  RussianLabels {
    private static final Map<String, String> LABELS;
    private static final Map<String, String> SYSTEM_PLAYLIST_LABELS;
    static {
        Map<String, String> labels = new HashMap<>();
        String[][] entries = {
            {"All", "Все"}, {"Tracks", "Треки"}, {"Profiles", "Профили"},
            {"People", "Пользователи"}, {"Playlists", "Плейлисты"},
            {"Albums", "Альбомы"}, {"Stations", "Станции"}, {"Users", "Пользователи"},
            {"Artists", "Артисты"}, {"Audio", "Аудио"}, {"Music", "Музыка"},
            {"Playlists & albums", "Плейлисты & альбомы"},
            {"Albums & playlists", "Альбомы & плейлисты"},
            {"Top Result", "Лучшие результаты"}, {"Top result", "Лучшие результаты"},
            {"Top results", "Лучшие результаты"}, {"See all", "Показать все"},
            {"View all", "Показать все"}, {"Show all", "Показать все"},
            {"More of what you like", "Больше того, что вам нравится"},
            
            {"We think you’ll like", "Возможно, вам понравится"},
            {"We think you'll like", "Возможно, вам понравится"},
            {"Trending by genre", "Рекомендации по жанрам"},
            {"Discover with Stations", "Открывайте для себя через станции"},
            {"Your daily mixes", "Ваши ежедневные миксы"}, {"Selected for you", "Подобрано для вас"},
            {"All genres", "Все жанры"}, {"ALL GENRES", "ВСЕ ЖАНРЫ"},
            {"All music genres", "Все музыкальные жанры"},
            {"Artists to watch out for", "Артисты, за которыми стоит следить"},
            {"Curated by SoundCloud", "Подборка SoundCloud"},
            {"New", "Новое"}, {"New!", "Новое!"}, {"Discover", "Обзор"},
            {"Discover more", "Откройте больше"}, {"Made for you", "Специально для вас"},
            {"Recommended for you", "Рекомендации для вас"}, {"Recommended", "Рекомендуем"},
            {"Suggested for you", "Предложения для вас"}, {"Picked for you", "Выбрано для вас"},
            {"Hot for you", "В тренде для вас"}, {"Hot For You", "В тренде для вас"},
            {"Recently played", "Недавно воспроизведённые"}, {"Your listening history", "История прослушивания"},
            {"Your likes", "Ваши лайки"}, {"Your playlists", "Ваши плейлисты"},
            {"Your stations", "Ваши станции"}, {"Your uploads", "Ваши загрузки"},
            {"Your albums", "Ваши альбомы"}, {"Your library", "Ваша библиотека"},
            {"Your Collection", "Ваша коллекция"}, {"Collection", "Коллекция"},
            {"Your mixes", "Ваши миксы"}, {"Mixes", "Миксы"},
            {"New releases", "Новые релизы"}, {"Latest releases", "Новые релизы"},
            {"Fresh releases", "Новые релизы"}, {"New releases for you", "Новые релизы для вас"},
            {"Fresh tracks for you", "Свежие треки для вас"},
            {"New music", "Новая музыка"}, {"Popular tracks", "Популярные треки"},
            {"Popular playlists", "Популярные плейлисты"}, {"Charts", "Чарты"},
            {"SoundCloud Charts", "Чарты SoundCloud"},
            {"Charts: Top 50", "Чарты: Топ-50"},
            {"Charts: New & hot", "Чарты: Новое & горячее"},
            {"Top 50", "Топ-50"}, {"Global Top 50", "Мировой топ-50"},
            {"Top 50: All music genres", "Топ-50: все жанры"},
            {"New & hot: All music genres", "Новое & горячее: все жанры"},
            {"Trending", "В тренде"}, {"Trending today", "В тренде сегодня"},
            {"Trending this week", "В тренде на этой неделе"},
            {"Popular in the scenes you love", "Популярно в любимых вами жанрах"},
            {"What's new on SoundCloud", "Что нового на SoundCloud"},
            {"What’s new on SoundCloud", "Что нового на SoundCloud"},
            {"Because you listened to", "Потому что вы слушали"},
            {"Related tracks", "Похожие треки"}, {"More like this", "Похожая музыка"},
            {"Similar artists", "Похожие артисты"}, {"Artists you should know", "Артисты, которых стоит знать"},
            {"Fans also like", "Фанатам также нравятся"}, {"Fans also listened to", "Фанаты также слушали"},
            {"From artists you follow", "От артистов, на которых вы подписаны"},
            {"From your follows", "От тех, на кого вы подписаны"},
            {"New from artists you follow", "Новая музыка от артистов, на которых вы подписаны"},
            {"Liked by", "Лайки от подписок"},
            {"Liked by you", "Понравилось вам"},
            {"Liked by your crew", "Понравилось вашим друзьям"},
            {"Liked By Your Crew", "Понравилось вашим друзьям"},
            {"Liked by your friends", "Понравилось вашим друзьям"},
            {"Liked by people you follow", "Лайки от подписок"},
            {"Liked by people I follow", "Понравилось тем, на кого я подписан"},
            {"Liked by artists you follow", "Лайки от подписок"},
            {"Reposted by", "Репост от"}, {"Followed by", "Подписаны"},
            {"Daily Drops", "Ежедневные рекомендации"}, {"Weekly Wave", "Волна недели"},
            {"Play", "Воспроизвести"}, {"Play all", "Воспроизвести все"}, {"Shuffle", "Перемешать"},
            {"Follow", "Подписаться"}, {"Following", "Вы подписаны"},
            {"Like", "Нравится"}, {"Liked", "Понравилось"}, {"Likes", "Лайки"},
            {"Repost", "Репост"}, {"Reposted", "Репостнуто"}, {"Reposts", "Репосты"},
            {"Comments", "Комментарии"}, {"Followers", "Подписчики"},
            {"Share", "Поделиться"}, {"Listen now", "Слушать сейчас"},
            {"Listen again", "Послушать снова"}, {"Listen next", "Слушать дальше"},
            {"Play next", "Играть следующим"}, {"Add to queue", "Добавить в очередь"},
            {"Add to playlist", "Добавить в плейлист"},
            {"Start station", "Запустить станцию"}, {"Go to artist", "К странице артиста"},
            {"View profile", "Посмотреть профиль"},
            {"Search", "Поиск"}, {"Search results", "Результаты поиска"},
            {"Genres", "Жанры"}, {"Moods", "Жанры"}, {"Vibes", "Жанры"},
            {"Subscriptions", "Подписки"}, {"More", "Ещё"},
            {"Featured", "Избранное"}, {"For you", "Для вас"},
            {"Liked tracks", "Лайки"}, {"Offline Backup", "Офлайн-резерв"},
            {"Listening history", "История прослушивания"}, {"Downloads", "Скачано"},
            {"Uploads", "Загрузки"}, {"Library", "Библиотека"}, {"Feed", "Лента"},
            {"Home", "Обзор"}, {"Explore", "Обзор"},
            {"Shortcuts", "Быстрый доступ"}, {"Artist Shortcuts", "Ярлыки артиста"},
            {"Artist stations", "Станции артистов"}, {"Track stations", "Станции треков"},
            {"Recent", "Недавние"}, {"Recently added", "Недавно добавленные"},
            {"Recently updated", "Недавно обновлённые"}, {"Most played", "Самые прослушиваемые"},
            {"Uploaded by you", "Загружено вами"}, {"Created by you", "Создано вами"},
            {"Saved", "Сохранено"}, {"On Repeat", "На повторе"}, {"On repeat", "На повторе"},
            {"Throwback", "Ностальгия"}, {"Throwbacks", "Ностальгическая музыка"},
            {"Your Playback", "Ваш Playback"},
            {"First Fans", "Первые фанаты"}, {"First fans", "Первые фанаты"},
            {"Top Fans", "Топ-фанаты"}, {"Top fans", "Топ-фанаты"},
            {"Fan Support", "Поддержка фанатов"}, {"Behind this track", "О треке"},
            {"Top tracks", "Топ треков"}, {"Top artists", "Топ артистов"},
            {"Top albums", "Топ альбомов"}, {"Top playlists", "Топ плейлистов"},
            {"Learn more", "Подробнее"}, {"More Info", "Дополнительная информация"},
            {"Start listening", "Начать слушать"}, {"Upgrade", "Улучшить"},
            {"Upgrade now", "Улучшить сейчас"}, {"Try it free", "Попробовать бесплатно"},
            {"Try Go+ free", "Попробовать Go+ бесплатно"}, {"Get Go+", "Оформить Go+"},
            {"Get Artist Pro", "Оформить Artist Pro"}, {"Get Pro", "Оформить Pro"},
            {"No ads", "Без рекламы"}, {"Dismiss", "Пропустить"}, {"Not now", "Позже"},
            {"Maybe later", "Позже"}, {"Got it", "Понятно"},
            {"Get started", "Начать"}, {"Continue", "Продолжить"},
            {"Refresh", "Обновить"}, {"Retry", "Повторить"}, {"Undo", "Отменить"},
            {"Clear", "Очистить"}, {"Filter", "Фильтр"}, {"Sort", "Сортировка"},
            {"Cancel", "Отмена"}, {"Save", "Сохранить"}, {"Done", "Готово"}, {"Close", "Закрыть"},
            {"Skip", "Пропустить"}, {"Next", "Далее"}, {"Back", "Назад"},
            {"Import your music", "Перенести вашу музыку"},
            {"Transfer your library", "Перенести библиотеку"},
            {"Offline listening", "Слушать офлайн"},
            {"Ad-free listening", "Прослушивание без рекламы"},
            {"High quality audio", "Аудио высокого качества"},
            {"Genres & Moods", "Жанры & настроения"},
            {"Moods & genres", "Настроения & жанры"},
            {"Explore genres", "Исследуйте жанры"}, {"Browse genres", "Обзор жанров"},
            {"Top charts", "Главные чарты"}, {"New & hot", "Новое & горячее"},
            {"Trending & Hot", "В тренде & Горячее"},
            {"Buzzing", "Горячее"}, {"Fresh pressed", "Свежие релизы"},
            {"Spotlight", "Spotlight"}, {"The Upload", "Микс Upload"},
            {"Mixed for you", "Микс для вас"},
            {"Curated playlists", "Подобранные плейлисты"},
            {"Featured playlists", "Избранные плейлисты"},
            {"Recommended tracks", "Рекомендуемые треки"},
            {"Recommended playlists", "Рекомендуемые плейлисты"},
            {"Recommended artists", "Рекомендуемые артисты"},
            {"Recommended albums", "Рекомендуемые альбомы"},
            {"Playlists for you", "Плейлисты для вас"},
            {"Albums for you", "Альбомы для вас"},
            {"Stations for you", "Станции для вас"},
            {"Tracks for you", "Треки для вас"},
            {"Artists on the rise", "Набирающие популярность артисты"},
            {"Emerging artists", "Новые артисты"},
            {"Trending playlists", "Трендовые плейлисты"},
            {"Trending tracks", "Трендовые треки"},
            {"Trending albums", "Трендовые альбомы"},
            {"Tracks & mixes", "Треки & миксы"},
          {"Hip Hop & Rap", "Хип Хоп и Реп"},
          {"Healing Era", "Медитация"},
          {"Soul", "Соул"},
          {"Country", "Кантри"},
          {"Latin", "Латин"},
            {"Chill", "Чилл"}, {"Workout", "Тренировка"}, {"Party", "Вечеринка"},
            {"Focus", "Концентрация"}, {"Study", "Учёба"}, {"Sleep", "Сон"},
            {"Gaming", "Игры"}, {"Driving", "За рулём"}, {"Romance", "Романтика"},
            {"Feel Good", "Веселая"}, {"Happy", "Весёлое"}, {"Sad", "Грустное"},
            {"At Home", "Дома"}, {"Cooking", "Готовка"}, {"Meditation", "Медитация"},
            {"Running", "Бег"}, {"Summer", "Лето"}, {"Classical", "Классика"},
          {"Ambient", "Эмбиент"},
          {"Electronic", "Электронная"},
          {"House", "Хаус"},
          {"Hip Hop", "хип хоп"},
          {"Hardcore", "Хардкор"},
          {"Jazz", "Джаз"},
          {"drum & bass", "ДНБ"},
          {"Folk", "Фолк"},
          {"Indie", "Инди"},
          {"Brakebeat", "Брейкбит"},
          {"Pop", "Поп"},
          {"Trance", "Транс"},
          {"downtempo", "Медленная"},
          {"dubstep", "Дабстеп"},
          {"synthwave", "Синтвейв"},
          {"alternative hip hop", "Альт хип хоп"},
          {"alternative rock", "Альт рок"},
          {"techno", "Техно"},
            {"Soundtrack", "Саундтреки"}, {"Audiobooks", "Аудиокниги"},
            {"Comedy", "Комедия"}, {"Storytelling", "Рассказы"},
            {"News & Politics", "Новости & политика"}, {"Science", "Наука"},
            {"Technology", "Технологии"}, {"Business", "Бизнес"},
            {"Sports", "Спорт"}, {"Religion & Spirituality", "Религия & духовность"},
            {"Entertainment", "Развлечения"}, {"Learning", "Обучение"},
            {"Mutual", "Общие подписчики"}, {"My tracks for sale", "Мои треки на продажу"},
            {"View in Collection", "Посмотреть в Коллекции"},
          {"Studio", "Студия"},
          {"Hot For You ", "Специально для вас "},
          {"people just liked this track", "понравился этот трек"},
          {"Your Discoveries", "Подборки треков"},
          {"Deep cuts", "Нишевые"},
          {"Forgotten faves", "Забытые лайки"},
          {"Hidden gems from the archive", "Архивная имба"},
          {"The tracks you forgot you love", "Треки о которыз вы уже забыли"},
          {"Your Favorites", "Ваши лайки"},
          {"Your current obsessions", "Треки, которыми вы одержимы"},
          {"Timeless tracks you never skip", "Длинные треки"},
          {"Latest from artists you follow", "Новинки от подписок"},
          {"Latest from artists you followed", "Новинки от подписок"},
          {"New track", "НОВИНКА!"},
          {"New album", "НОВЫЙ АЛЬБОМ!"},
          {"New crew, suggested for you", "Подборка артистов"},
          {"New releases based on your taste. Updated every day", "Новые релизы на основе вашего вкуса. Обновляется ежедневно"},
          {"The best of SoundCloud just for you. Updated every Monday", "Еженедельная подборка треков для вас"},
          {"Today's Pick", "Трек Дня"}
        };
        for (String[] entry : entries) {
            labels.put(entry[0], entry[1]);
            labels.putIfAbsent(entry[0].toLowerCase(Locale.ROOT), entry[1]);
        }
        LABELS = Collections.unmodifiableMap(labels);

        Map<String, String> sysPlaylists = new HashMap<>();
        String[][] sysEntries = {
            {"Liked by", "Понравилось"}, {"Liked By", "Понравилось"},
            {"Liked by your crew", "Понравилось вашим друзьям"},
            {"Liked By Your Crew", "Понравилось вашим друзьям"},
            {"Liked by your friends", "Понравилось вашим друзьям"},
            {"Liked by people you follow", "Понравилось тем, на кого вы подписаны"},
            {"Liked by artists you follow", "Понравилось артистам, на которых вы подписаны"},
            {"Daily Drops", "Ежедневные рекомендации"}, {"Weekly Wave", "Волна недели"},
            {"The Upload", "Микс Upload"}
        };
        for (String[] entry : sysEntries) {
            sysPlaylists.put(entry[0], entry[1]);
            sysPlaylists.putIfAbsent(entry[0].toLowerCase(Locale.ROOT), entry[1]);
        }
        SYSTEM_PLAYLIST_LABELS = Collections.unmodifiableMap(sysPlaylists);
    }

    public static String translate(String text) {
        return translateForLanguage(text, Locale.getDefault().getLanguage());
    }

    public static String translateChoice(String text) {
        return translateChoiceForLanguage(text, Locale.getDefault().getLanguage());
    }

    public static String translateSystemPlaylist(String text) {
        return translateSystemPlaylistForLanguage(text, Locale.getDefault().getLanguage());
    }

    static String translateChoiceForLanguage(String text, String language) {
        // Search tabs have a fixed, narrow width; keep the full phrase in section headers.
        if ("ru".equals(language) && text != null && "playlists".equalsIgnoreCase(text)) return "Плейлисты";
        return translateForLanguage(text, language);
    }

    static String translateSystemPlaylistForLanguage(String text, String language) {
        if (text == null || !"ru".equals(language)) return text;
        String exact = SYSTEM_PLAYLIST_LABELS.get(text);
        if (exact == null) exact = SYSTEM_PLAYLIST_LABELS.get(text.toLowerCase(Locale.ROOT));
        if (exact != null) return exact;
        String[][] prefixes = {
            {"Liked by: ", "Понравилось: "}, {"Liked By: ", "Понравилось: "},
            {"Liked by ", "Понравилось "}, {"Liked By ", "Понравилось "},
            {"Mixed for ", "Микс для "}
        };
        for (String[] prefix : prefixes) {
            if (text.startsWith(prefix[0])) return prefix[1] + text.substring(prefix[0].length());
        }
        return text;
    }

    static String translateForLanguage(String text, String language) {
        if (text == null || !"ru".equals(language)) return text;
        String translated = LABELS.get(text);
        if (translated == null) translated = LABELS.get(text.toLowerCase(Locale.ROOT));
        if (translated != null) return translated;
        // These prefixes belong to section subtitles and reasons; preserve the artist/title suffix verbatim.
        String[][] prefixes = {
            {"Based on ", "На основе "}, {"Because you listened to ", "Потому что вы слушали "},
            {"Because you follow ", "Потому что вы подписаны на "},
            {"Because you followed ", "Потому что вы подписались на "},
            {"Mixed for ", "Микс для "},
            {"Because you liked ", "Потому что вам понравилось "},
            {"Liked by: ", "Понравилось: "}, {"Liked By: ", "Понравилось: "},
            {"Liked by ", "Понравилось "}, {"Liked By ", "Понравилось "},
            {"Reposted by ", "Репост от "},
            {"Followed by ", "Подписаны: "},
            {"Popular with listeners of ", "Популярно у слушателей "},
            {"Popular with fans of ", "Популярно у фанатов "},
            {"For fans of ", "Для фанатов "},
            {"Similar to ", "Похоже на "},
            {"Inspired by ", "Вдохновлено: "},
            {"Featuring ", "При участии "},
            {"Feat. ", "Участие: "},
            {"Curated by ", "Подборка от "},
            {"Created by ", "Создано: "},
            {"Playlist by ", "Плейлист от "},
            {"Station based on ", "Станция на основе "},
            {"Trending in ", "В тренде: "},
            {"Top tracks in ", "Топ треков: "},
            {"New in ", "Новое: "},
            {"Best of ", "Лучшее от "},
            {"Related tracks: ", "Похожие треки: "},
            {"Recommended from ", "Рекомендации от "},
            {"Artists like ", "Артисты, похожие на "},
            {"More from ", "Ещё от "}, {"New from ", "Новое от "},
            {"Latest tracks: ", "Новейшие треки: "},
            {"Made for ", "Для "}
        };
        for (String[] prefix : prefixes) {
            if (text.startsWith(prefix[0])) return prefix[1] + text.substring(prefix[0].length());
        }
        return text;
    }

    private RussianLabels() {}
}
