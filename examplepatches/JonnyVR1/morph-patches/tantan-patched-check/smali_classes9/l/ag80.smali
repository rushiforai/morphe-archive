.class public final synthetic Ll/ag80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ig80;


# direct methods
.method public synthetic constructor <init>(Ll/ig80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ag80;->a:Ll/ig80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ag80;->a:Ll/ig80;

    check-cast p1, Ll/iu70;

    invoke-static {p0, p1}, Ll/ig80;->g4(Ll/ig80;Ll/iu70;)Ll/fyb;

    move-result-object p0

    return-object p0
.end method
