.class public final synthetic Ll/vr5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wr5;


# direct methods
.method public synthetic constructor <init>(Ll/wr5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vr5;->a:Ll/wr5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vr5;->a:Ll/wr5;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/wr5;->b(Ll/wr5;Ljava/lang/Integer;)V

    return-void
.end method
