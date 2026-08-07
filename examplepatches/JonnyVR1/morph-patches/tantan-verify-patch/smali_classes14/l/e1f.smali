.class public final synthetic Ll/e1f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rnl;


# direct methods
.method public synthetic constructor <init>(Ll/rnl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e1f;->a:Ll/rnl;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e1f;->a:Ll/rnl;

    check-cast p1, Ljava/util/regex/Pattern;

    invoke-static {p0, p1}, Ll/f1f;->d(Ll/rnl;Ljava/util/regex/Pattern;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
