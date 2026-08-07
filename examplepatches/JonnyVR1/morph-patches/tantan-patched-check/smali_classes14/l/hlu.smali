.class public final synthetic Ll/hlu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vlu;


# direct methods
.method public synthetic constructor <init>(Ll/vlu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hlu;->a:Ll/vlu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hlu;->a:Ll/vlu;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/vlu;->i3(Ll/vlu;Ljava/lang/Long;)V

    return-void
.end method
