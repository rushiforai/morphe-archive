.class public final synthetic Ll/krr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/prr;

.field public final synthetic b:Ll/msr;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/prr;Ll/msr;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/krr;->a:Ll/prr;

    iput-object p2, p0, Ll/krr;->b:Ll/msr;

    iput-object p3, p0, Ll/krr;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/krr;->a:Ll/prr;

    iget-object v1, p0, Ll/krr;->b:Ll/msr;

    iget-object p0, p0, Ll/krr;->c:Ljava/util/List;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Ll/prr;->m(Ll/prr;Ll/msr;Ljava/util/List;Ljava/lang/Long;)V

    return-void
.end method
