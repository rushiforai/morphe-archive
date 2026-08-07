.class public final synthetic Ll/ni00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Ll/hj00;


# direct methods
.method public synthetic constructor <init>(Ll/hj00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ni00;->a:Ll/hj00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ni00;->a:Ll/hj00;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-static {p0, p1, p2}, Ll/hj00;->e0(Ll/hj00;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
