package app.yydarlinker.deepseekcaptions;

/** HTTP backoff in either delta seconds or an absolute date, never shortened before retry. */
final class RetryAfter {
    static long delayMs(String value, long now) {
        if (value == null) return 0;
        value = value.trim();
        if (value.isEmpty()) return 0;
        long seconds = 0;
        boolean digits = true;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c < '0' || c > '9') {
                digits = false;
                break;
            }
            int digit = c - '0';
            seconds =
                    seconds > (Long.MAX_VALUE - digit) / 10
                            ? Long.MAX_VALUE : seconds * 10 + digit;
        }
        if (digits) return seconds > Long.MAX_VALUE / 1000 ? Long.MAX_VALUE : seconds * 1000;
        try {
            long at =
                    java.time.ZonedDateTime.parse(
                                    value,
                                    java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME)
                            .toInstant()
                            .toEpochMilli();
            if (at <= now) return 0;
            return now < 0 && at > Long.MAX_VALUE + now ? Long.MAX_VALUE : at - now;
        } catch (RuntimeException invalid) {
            return 0;
        }
    }

    static long after(long now, long delay) {
        delay = Math.max(0, delay);
        return now > Long.MAX_VALUE - delay ? Long.MAX_VALUE : now + delay;
    }
}
