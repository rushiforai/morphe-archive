.class public final synthetic Ll/kvm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lrx/subjects/a;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ll/vwl;


# direct methods
.method public synthetic constructor <init>(ZLrx/subjects/a;Ljava/util/List;Ll/vwl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/kvm;->a:Z

    iput-object p2, p0, Ll/kvm;->b:Lrx/subjects/a;

    iput-object p3, p0, Ll/kvm;->c:Ljava/util/List;

    iput-object p4, p0, Ll/kvm;->d:Ll/vwl;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/kvm;->a:Z

    iget-object v1, p0, Ll/kvm;->b:Lrx/subjects/a;

    iget-object v2, p0, Ll/kvm;->c:Ljava/util/List;

    iget-object p0, p0, Ll/kvm;->d:Ll/vwl;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, v2, p0, p1}, Ll/nvm;->i(ZLrx/subjects/a;Ljava/util/List;Ll/vwl;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
