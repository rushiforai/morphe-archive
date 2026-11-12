.class public final enum Ll49;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Ll49;

.field public static final enum b:Ll49;

.field public static final synthetic c:[Ll49;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ll49;

    const-string v1, "GRANTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ll49;->a:Ll49;

    new-instance v1, Ll49;

    const-string v2, "DENIED"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Ll49;->b:Ll49;

    filled-new-array {v0, v1}, [Ll49;

    move-result-object v0

    sput-object v0, Ll49;->c:[Ll49;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ll49;
    .registers 2
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const-class v0, Ll49;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Ll49;

    return-object p0
.end method

.method public static values()[Ll49;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Ll49;->c:[Ll49;

    invoke-virtual {v0}, [Ll49;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ll49;

    return-object v0
.end method
