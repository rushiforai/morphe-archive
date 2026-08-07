.class public final synthetic Ll/bnc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ydg0;


# direct methods
.method public synthetic constructor <init>(Ll/ydg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bnc0;->a:Ll/ydg0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnc0;->a:Ll/ydg0;

    check-cast p1, Ll/enc0;

    invoke-static {p0, p1}, Ll/enc0;->n(Ll/ydg0;Ll/enc0;)Ll/jni0;

    move-result-object p0

    return-object p0
.end method
