.class public Ll/myq0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/Object;

.field public static final b:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final c:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/myq0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    sget-object v0, Lcom/xiaomi/push/gh;->o:Lcom/xiaomi/push/gh;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/xiaomi/push/gh;->a()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/myq0;->b:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v0, Lcom/xiaomi/push/gh;->p:Lcom/xiaomi/push/gh;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/xiaomi/push/gh;->a()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Ll/myq0;->c:Ljava/lang/String;

    .line 31
    .line 32
    return-void
.end method
