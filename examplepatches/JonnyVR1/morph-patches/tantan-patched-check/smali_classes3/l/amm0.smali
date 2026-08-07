.class public final synthetic Ll/amm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/hnm0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/hnm0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/amm0;->a:Ll/hnm0;

    iput-boolean p2, p0, Ll/amm0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/amm0;->a:Ll/hnm0;

    iget-boolean p0, p0, Ll/amm0;->b:Z

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/hnm0;->W3(Ll/hnm0;ZLjava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
