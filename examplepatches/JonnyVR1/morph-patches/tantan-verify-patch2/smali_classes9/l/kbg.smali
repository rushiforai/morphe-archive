.class public final synthetic Ll/kbg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mbg;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/mbg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kbg;->a:Ll/mbg;

    iput-object p2, p0, Ll/kbg;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kbg;->a:Ll/mbg;

    iget-object p0, p0, Ll/kbg;->b:Ljava/lang/String;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/mbg;->i4(Ll/mbg;Ljava/lang/String;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
