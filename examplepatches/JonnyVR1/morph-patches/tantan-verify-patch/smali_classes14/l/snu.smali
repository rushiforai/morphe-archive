.class public final synthetic Ll/snu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xnu;

.field public final synthetic b:Ll/uxj;


# direct methods
.method public synthetic constructor <init>(Ll/xnu;Ll/uxj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/snu;->a:Ll/xnu;

    iput-object p2, p0, Ll/snu;->b:Ll/uxj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/snu;->a:Ll/xnu;

    iget-object p0, p0, Ll/snu;->b:Ll/uxj;

    check-cast p1, Ll/xxj;

    invoke-static {v0, p0, p1}, Ll/xnu;->b(Ll/xnu;Ll/uxj;Ll/xxj;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
