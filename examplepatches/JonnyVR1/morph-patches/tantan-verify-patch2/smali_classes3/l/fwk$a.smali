.class public Ll/fwk$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fwk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/ui/guidetip/GuideTipsView;

.field public d:Ll/zvk;

.field public final synthetic e:Ll/fwk;


# direct methods
.method public constructor <init>(Ll/fwk;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fwk$a;->e:Ll/fwk;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/fwk$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method
