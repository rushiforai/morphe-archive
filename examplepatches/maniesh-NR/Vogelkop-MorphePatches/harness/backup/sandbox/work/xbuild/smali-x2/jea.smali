.class public final enum Ljea;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic a:[Ljea;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ljea;

    const-string v1, "HIDE_WHILE_INTERACTING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance v1, Ljea;

    const-string v2, "SHOW_NEVER"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    filled-new-array {v0, v1}, [Ljea;

    move-result-object v0

    sput-object v0, Ljea;->a:[Ljea;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljea;
    .registers 2

    const-class v0, Ljea;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ljea;

    return-object p0
.end method

.method public static values()[Ljea;
    .registers 1

    sget-object v0, Ljea;->a:[Ljea;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljea;

    return-object v0
.end method
