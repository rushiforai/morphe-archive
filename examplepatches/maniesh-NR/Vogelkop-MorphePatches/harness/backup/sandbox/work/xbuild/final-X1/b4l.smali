.class public final enum Lb4l;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum a:Lb4l;

.field public static final enum b:Lb4l;

.field public static final enum c:Lb4l;

.field public static final synthetic d:[Lb4l;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lb4l;

    const-string v1, "UPGRADE_DIALOG"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lb4l;->a:Lb4l;

    new-instance v1, Lb4l;

    const-string v2, "TOUR_BUBBLES"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lb4l;->b:Lb4l;

    new-instance v2, Lb4l;

    const-string v3, "NONE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lb4l;->c:Lb4l;

    filled-new-array {v0, v1, v2}, [Lb4l;

    move-result-object v0

    sput-object v0, Lb4l;->d:[Lb4l;

    new-instance v0, Lh58;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lb4l;
    .registers 2

    const-class v0, Lb4l;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lb4l;

    return-object p0
.end method

.method public static values()[Lb4l;
    .registers 1

    sget-object v0, Lb4l;->d:[Lb4l;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lb4l;

    return-object v0
.end method
