.class public final synthetic Ll/jt00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nt00;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:[Ll/nqy;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Ll/nt00$b;


# direct methods
.method public synthetic constructor <init>(Ll/nt00;Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Ll/nt00$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jt00;->a:Ll/nt00;

    iput-object p2, p0, Ll/jt00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/jt00;->c:[Ll/nqy;

    iput-object p4, p0, Ll/jt00;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/jt00;->e:Ll/nt00$b;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/jt00;->a:Ll/nt00;

    iget-object v1, p0, Ll/jt00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/jt00;->c:[Ll/nqy;

    iget-object v3, p0, Ll/jt00;->d:Lcom/p1/mobile/android/app/Act;

    iget-object v4, p0, Ll/jt00;->e:Ll/nt00$b;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/nt00;->e(Ll/nt00;Lcom/p1/mobile/putong/feed/data/Moment;[Ll/nqy;Lcom/p1/mobile/android/app/Act;Ll/nt00$b;Landroid/view/View;)V

    return-void
.end method
