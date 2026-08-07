.class public final Ll/srg$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/srg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public c:Landroid/view/ViewGroup;

.field public d:Ljava/lang/String;

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Landroid/view/ViewGroup;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Landroid/view/ViewGroup;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/srg$a;->b:Ljava/util/List;

    .line 5
    .line 6
    iput-object p3, p0, Ll/srg$a;->c:Landroid/view/ViewGroup;

    .line 7
    .line 8
    iput-object p1, p0, Ll/srg$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Ll/srg$a;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srg$a;->a:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/srg$a;)Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srg$a;->c:Landroid/view/ViewGroup;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/srg$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srg$a;->g:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/srg$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/srg$a;->f:Z

    return p0
.end method

.method public static bridge synthetic e(Ll/srg$a;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srg$a;->e:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/srg$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srg$a;->d:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/srg$a;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/srg$a;->b:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public h()Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/srg;->b(Ll/srg$a;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ljava/lang/String;)Ll/srg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/srg$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/srg$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/srg$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
