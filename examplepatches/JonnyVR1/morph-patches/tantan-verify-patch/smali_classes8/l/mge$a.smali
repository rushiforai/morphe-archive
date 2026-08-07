.class public Ll/mge$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/BannerLoc;

.field public b:Z

.field public final synthetic c:Ll/mge;


# direct methods
.method public constructor <init>(Ll/mge;Lcom/p1/mobile/putong/data/BannerLoc;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mge$a;->c:Ll/mge;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/mge$a;->a:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/mge$a;->b:Z

    .line 9
    .line 10
    return-void
.end method
