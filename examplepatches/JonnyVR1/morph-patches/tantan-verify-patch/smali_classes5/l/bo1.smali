.class public final synthetic Ll/bo1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/do1;


# direct methods
.method public synthetic constructor <init>(Ll/do1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bo1;->a:Ll/do1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bo1;->a:Ll/do1;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/do1;->x0(Ll/do1;Ljava/lang/Integer;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
