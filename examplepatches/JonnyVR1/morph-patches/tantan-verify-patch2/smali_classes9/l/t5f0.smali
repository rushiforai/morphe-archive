.class public final synthetic Ll/t5f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/b6f0;


# direct methods
.method public synthetic constructor <init>(Ll/b6f0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5f0;->a:Ll/b6f0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t5f0;->a:Ll/b6f0;

    check-cast p1, Ll/a5f0;

    invoke-static {p0, p1}, Ll/b6f0;->N3(Ll/b6f0;Ll/a5f0;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
