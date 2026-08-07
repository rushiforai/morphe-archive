.class public final synthetic Ll/tr70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$d;


# instance fields
.field public final synthetic a:Ll/rs70;


# direct methods
.method public synthetic constructor <init>(Ll/rs70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tr70;->a:Ll/rs70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tr70;->a:Ll/rs70;

    check-cast p1, Lrx/c;

    invoke-static {p0, p1}, Ll/rs70;->M3(Ll/rs70;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
