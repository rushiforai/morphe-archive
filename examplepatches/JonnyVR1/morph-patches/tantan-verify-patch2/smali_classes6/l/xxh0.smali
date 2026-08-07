.class public Ll/xxh0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Ll/xxh0;


# instance fields
.field public a:Lcom/momo/mcamera/mask/MaskStore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/xxh0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xxh0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/xxh0;->b:Ll/xxh0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/momo/mcamera/mask/MaskStore;->getInstance()Lcom/momo/mcamera/mask/MaskStore;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/xxh0;->a:Lcom/momo/mcamera/mask/MaskStore;

    .line 9
    .line 10
    return-void
.end method

.method public static a()Ll/xxh0;
    .locals 1

    .line 1
    sget-object v0, Ll/xxh0;->b:Ll/xxh0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public b(Landroid/content/Context;Ljava/lang/String;)Ll/wxh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxh0;->a:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/MaskStore;->getMask(Landroid/content/Context;Ljava/lang/String;)Lcom/momo/mcamera/mask/MaskModel;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ll/wxh0;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/wxh0;-><init>(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method
