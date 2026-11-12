.class public abstract synthetic Lwu1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:Lh58;

.field public static final synthetic b:Lh58;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    invoke-static {}, Lf7j;->values()[Lf7j;

    move-result-object v0

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lwu1;->a:Lh58;

    invoke-static {}, Lg7j;->values()[Lg7j;

    move-result-object v0

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lwu1;->b:Lh58;

    return-void
.end method
