.class public final synthetic Ll/hf00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jf00;


# direct methods
.method public synthetic constructor <init>(Ll/jf00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hf00;->a:Ll/jf00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf00;->a:Ll/jf00;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/jf00;->b(Ll/jf00;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
