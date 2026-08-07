.class public final synthetic Ll/htg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/itg;

.field public final synthetic b:Ll/z20;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Ll/itg;Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/htg;->a:Ll/itg;

    iput-object p2, p0, Ll/htg;->b:Ll/z20;

    iput-object p3, p0, Ll/htg;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput p4, p0, Ll/htg;->d:I

    iput p5, p0, Ll/htg;->e:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/htg;->a:Ll/itg;

    iget-object v1, p0, Ll/htg;->b:Ll/z20;

    iget-object v2, p0, Ll/htg;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget v3, p0, Ll/htg;->d:I

    iget v4, p0, Ll/htg;->e:I

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/itg;->d(Ll/itg;Ll/z20;Lcom/p1/mobile/putong/feed/data/Moment;IILandroid/view/View;)V

    return-void
.end method
