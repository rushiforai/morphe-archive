.class public final synthetic Ll/c6j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/adj;


# instance fields
.field public final synthetic a:Ll/d6j;


# direct methods
.method public synthetic constructor <init>(Ll/d6j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c6j;->a:Ll/d6j;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c6j;->a:Ll/d6j;

    check-cast p1, Ll/yej0;

    invoke-virtual {p0, p1}, Ll/d6j;->m(Ll/yej0;)Ll/yej0;

    move-result-object p0

    return-object p0
.end method
