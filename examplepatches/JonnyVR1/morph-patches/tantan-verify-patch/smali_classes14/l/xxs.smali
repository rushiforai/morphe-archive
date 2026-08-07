.class public final synthetic Ll/xxs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bys;


# direct methods
.method public synthetic constructor <init>(Ll/bys;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xxs;->a:Ll/bys;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxs;->a:Ll/bys;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/bys;->S2(Ll/bys;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
