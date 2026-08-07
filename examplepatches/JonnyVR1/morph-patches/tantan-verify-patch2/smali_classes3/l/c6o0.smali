.class public final synthetic Ll/c6o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/k6o0;


# direct methods
.method public synthetic constructor <init>(Ll/k6o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c6o0;->a:Ll/k6o0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c6o0;->a:Ll/k6o0;

    check-cast p1, Ll/x5o0;

    invoke-static {p0, p1}, Ll/k6o0;->R3(Ll/k6o0;Ll/x5o0;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
