.class public final synthetic Ll/ib2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ner;


# direct methods
.method public synthetic constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ib2;->a:Ll/ner;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib2;->a:Ll/ner;

    invoke-static {p0, p1}, Ll/lb2;->j(Ll/ner;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
