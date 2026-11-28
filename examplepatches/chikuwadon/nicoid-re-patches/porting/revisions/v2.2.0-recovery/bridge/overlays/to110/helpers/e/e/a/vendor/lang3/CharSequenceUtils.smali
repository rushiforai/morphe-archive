.class public abstract Le/e/a/vendor/lang3/CharSequenceUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .line 37
    new-instance v0, Ljava/lang/String;

    const v1, 0x10400

    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    new-instance v3, Ljava/lang/String;

    const v1, 0x10428

    .line 38
    invoke-static {v1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>([C)V

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 37
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    return-void
.end method
