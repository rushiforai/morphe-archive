.class public final synthetic Ll/imo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/zmo0;


# direct methods
.method public synthetic constructor <init>(Ll/zmo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/imo0;->a:Ll/zmo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imo0;->a:Ll/zmo0;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Ll/zmo0;->c0(Ljava/lang/Integer;Ljava/lang/Object;)V

    return-void
.end method
