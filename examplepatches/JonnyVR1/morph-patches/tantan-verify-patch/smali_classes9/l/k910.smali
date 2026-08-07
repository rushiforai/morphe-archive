.class public final synthetic Ll/k910;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p910;


# direct methods
.method public synthetic constructor <init>(Ll/p910;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k910;->a:Ll/p910;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k910;->a:Ll/p910;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/p910;->s1(Ll/p910;Ljava/lang/Long;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
