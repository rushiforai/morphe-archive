.class public final synthetic Ll/ed10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/td10;


# direct methods
.method public synthetic constructor <init>(Ll/td10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ed10;->a:Ll/td10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ed10;->a:Ll/td10;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Ll/td10;->w4(Ljava/util/List;)V

    return-void
.end method
