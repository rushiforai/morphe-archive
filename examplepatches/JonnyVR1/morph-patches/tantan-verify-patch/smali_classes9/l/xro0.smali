.class public final synthetic Ll/xro0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zro0;

.field public final synthetic b:Ll/isv;


# direct methods
.method public synthetic constructor <init>(Ll/zro0;Ll/isv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xro0;->a:Ll/zro0;

    iput-object p2, p0, Ll/xro0;->b:Ll/isv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xro0;->a:Ll/zro0;

    iget-object p0, p0, Ll/xro0;->b:Ll/isv;

    check-cast p1, Ll/kfn0;

    invoke-static {v0, p0, p1}, Ll/zro0;->k(Ll/zro0;Ll/isv;Ll/kfn0;)V

    return-void
.end method
