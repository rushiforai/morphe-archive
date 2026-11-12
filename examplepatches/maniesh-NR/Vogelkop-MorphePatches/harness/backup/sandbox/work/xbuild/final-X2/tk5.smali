.class public abstract synthetic Ltk5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:Lh58;

.field public static final synthetic b:Lh58;

.field public static final synthetic c:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    invoke-static {}, Lg7j;->values()[Lg7j;

    move-result-object v0

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ltk5;->a:Lh58;

    invoke-static {}, Lf7j;->values()[Lf7j;

    move-result-object v0

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ltk5;->b:Lh58;

    invoke-static {}, Lo7j;->values()[Lo7j;

    move-result-object v0

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Ltk5;->c:Lh58;

    return-void
.end method
