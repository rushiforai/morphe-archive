.class public final synthetic Ll/fbn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mbn0;


# direct methods
.method public synthetic constructor <init>(Ll/mbn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fbn0;->a:Ll/mbn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fbn0;->a:Ll/mbn0;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/mbn0;->e0(Ll/mbn0;Ljava/lang/Integer;)V

    return-void
.end method
