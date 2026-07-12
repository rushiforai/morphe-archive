package app.utsavrajput.extension

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Base64

/**
 * Real MX Player bottom-nav icons, embedded as Base64 PNG bytes and decoded
 * at runtime. This sidesteps the extension module's resource-merge
 * limitation entirely (extendWith() only merges DEX, never res/*), while
 * still giving pixel-identical icons to the ones MX Player itself uses —
 * because they ARE the same PNG files, just extracted from the app.
 *
 * To add Local / Search / Games: pull the equivalent
 * "<tab>_bn_selected.png" / "<tab>_bn_def.png" files from
 * res/drawable-xxhdpi (or wherever fatafat_bn_selected.png lives) via
 * apktool, base64-encode them, and add constants + decode calls below
 * following the same pattern as FATAFAT_*.
 */
object IconAssets {

    private const val FATAFAT_SELECTED_B64 =
        "iVBORw0KGgoAAAANSUhEUgAAAFgAAABYCAMAAABGS8AGAAAAUVBMVEXX/wbf/wDY/wXY/wbZ/wbZ/wbX/wbZ/wXa/wXY/wfY/wfX/wja/wfa/w" +
        "XZ/wbY/wbY/wfa/wvZ/wbY/wfX/wjX/wUAAADY/wfX/wjf/xDY/wbfzdoHAAAAGnRSTlOgEJDff1CA74+Qv2BvMO/PcDCfr0BgAN8gEL23db8A" +
        "AAIlSURBVFjD7Zltd8IgDIW7oWyrk74Ikvr/f+hw7sy2QElC+k0+ejyPt9fcJJw2151O8wKXwe7GOH4qgxUHfCorZgm+IKxgCYYymCVYI/48jm" +
        "CPqApXaUQWzBH8hahjjmAPCLCqKuE8mCN4xERaVRuRBnME95gmpCpLOAd2tSWcA6u6LGfBTsKIFDgv2OjMOWPAjvTAhNGkSA+MB1vKP08BtzJG" +
        "RGCLmL8scIttXkSwRTcvIrjdaF7g4jMhwXbLiJFWKA1KcJsOjkZaYTdKeFLExDQYwUHZJzUxDUJwUAbFcb8BbjeyrMiJeYKHx9d7k1B2oCfmCb" +
        "6Xkz/F4oIyuJm2IybmHwwPbFxW4cNzP61/zwMWrP0p6fSfsm9q61i3zSHOsnXheT6orWMNXgfXH9SdsvrYABWcqtdAcaW9pwgek9sTKPr0W4Ih" +
        "3RFGxvRrirMfoqxreqNXyQbUcdaApiD4TplgcSY6ONGGrMQl3QrM0CR4LF8AWGCoXybS4FHQiDkYjKARc7CTNGIOVollQgL8K9jw9+EsuAtXDA" +
        "D+PpwfTWGuzSPir0LgB13KiPwaW2nEGmy4F4MCeJAp4RjcS2Q5Bb5IZDkFVmJGLMEgZ8QSfESvOUTwO3rNIYI7kSzH4DeZLOcuN/oqDtaCRsS3" +
        "pmEHsCne3XjgQSjLEbgXynIEvghlOTH+BY1YXiAFjZiBj5ULShY83mAfcKev+4ClX+y9Xm3uD/4BAiiyJlKLrfkAAAAASUVORK5CYII="

    private const val FATAFAT_DEF_B64 =
        "iVBORw0KGgoAAAANSUhEUgAAAFgAAABYCAMAAABGS8AGAAAAWlBMVEWPn7+Wo7yYo7yWo7qWobmXo7uapbqXp7+Vobqfn6+WoruVn7qVoruWor" +
        "uXo7qWoriXo7qXpLqVobmVorqfr7+Xo7uXn7eXorqVobqYo7sAAACWorqXorqWoroIpsqDAAAAHXRSTlMQUG/PoH8wIO8QcDDvj79wkJ+AYBBA" +
        "IJ+QrwDfYEabbiIAAAImSURBVFjD7ZdRd4IwDIXrmBSQsUGlm0T//99cnTsTaEuTNLytjxzP5+WSm6Rq2umof3AabG6MA+c0GDjga1oxS/AFYQ" +
        "VLsE2DWYIHxMfjCAZEVZhMI6JgjuAPRB1zBINFgCGrhONgjuBPTKQh24gwmCP4HdOEILOEY2CTW8IxMORlOQo2EkaEwHHB7RA5JwzYkF6YMJqA" +
        "9MJ48Ej58hRwJ2OEB44LhjoL3GGbFxE8opsXEdxtNC9t/HNGgsctI3paoSiU4C4cnAFpxbhRwmcgJkZhBDtlb9TEKIRgp0wnx/0GuNvIMpAT8w" +
        "SXj583VUDZkZ6YJ/heTnD1xTll+tZ2BTExf2D9wPpl5R6emnr9f2Cx4AGuQad/lb1QW8e6bZZ+lkfj3qelto41eB1cOMKdsnrcWio4VK+OYlJ7" +
        "TxLcB7cnDfTptwTrcEfoGdNPJWe/9bI+0Bs9BBtQwVkDVELwnVLbxanp4EAbGiUu6aPADA2C+/QFgAXW+ctEGNwLGjEH60rQiDnYSBoxB0NgmZ" +
        "AA/whu+ftwFFy4K4a1/H04PprcXJtHBCYh8IMuZUR8jc00Yg2uuBeDBLiUKWEf3EhkOQS+SGQ5BAYxI5ZgLWfEEnxArzlE8Bd6zSGCC5Es+2Al" +
        "k+XY5WaYxMGDoBH+rancAVwl7248cCmUZQ/cCGXZA1+EshwY/4JGLC+QgkbMwIfMBSUK7m92H3AxTPuAX6edwNM/eC/wN5CbIeo1GHAKAAAAAE" +
        "lFTkSuQmCC"

    // TODO: paste Local's two icons here once extracted
    // private const val LOCAL_SELECTED_B64 = "..."
    // private const val LOCAL_DEF_B64 = "..."

    // TODO: paste Search's two icons here once extracted
    // private const val SEARCH_SELECTED_B64 = "..."
    // private const val SEARCH_DEF_B64 = "..."

    // TODO: paste Games's two icons here once extracted
    // private const val GAMES_SELECTED_B64 = "..."
    // private const val GAMES_DEF_B64 = "..."

    private var fatafatSelectedBitmap: Bitmap? = null
    private var fatafatDefBitmap: Bitmap? = null

    private fun decode(base64: String): Bitmap {
        val bytes = Base64.decode(base64, Base64.DEFAULT)
        return BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
    }

    @JvmStatic
    fun fatafatSelected(): Bitmap {
        var bmp = fatafatSelectedBitmap
        if (bmp == null) {
            bmp = decode(FATAFAT_SELECTED_B64)
            fatafatSelectedBitmap = bmp
        }
        return bmp
    }

    @JvmStatic
    fun fatafatDefault(): Bitmap {
        var bmp = fatafatDefBitmap
        if (bmp == null) {
            bmp = decode(FATAFAT_DEF_B64)
            fatafatDefBitmap = bmp
        }
        return bmp
    }
}