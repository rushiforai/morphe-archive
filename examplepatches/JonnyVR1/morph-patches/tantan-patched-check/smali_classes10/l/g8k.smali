.class public final synthetic Ll/g8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l8k;


# direct methods
.method public synthetic constructor <init>(Ll/l8k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g8k;->a:Ll/l8k;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g8k;->a:Ll/l8k;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/l8k;->a4(Ll/l8k;Ljava/util/List;)V

    return-void
.end method
