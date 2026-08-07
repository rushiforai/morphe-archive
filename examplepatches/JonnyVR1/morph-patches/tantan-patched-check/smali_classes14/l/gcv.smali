.class public final synthetic Ll/gcv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/icv;


# direct methods
.method public synthetic constructor <init>(Ll/icv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gcv;->a:Ll/icv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gcv;->a:Ll/icv;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/icv;->f(Ll/icv;Ljava/lang/Integer;)V

    return-void
.end method
