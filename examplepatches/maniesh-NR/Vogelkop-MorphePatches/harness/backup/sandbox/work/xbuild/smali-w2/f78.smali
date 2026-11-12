.class public final enum Lf78;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lf78;

.field public static final synthetic b:[Lf78;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lf78;

    const-string v1, "INFO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lf78;->a:Lf78;

    filled-new-array {v0}, [Lf78;

    move-result-object v0

    sput-object v0, Lf78;->b:[Lf78;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lf78;
    .registers 2

    const-class v0, Lf78;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lf78;

    return-object p0
.end method

.method public static values()[Lf78;
    .registers 1

    sget-object v0, Lf78;->b:[Lf78;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lf78;

    return-object v0
.end method
