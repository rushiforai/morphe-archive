.class public final synthetic Ll/fbd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tbd0;

.field public final synthetic b:Ll/dbd0;


# direct methods
.method public synthetic constructor <init>(Ll/tbd0;Ll/dbd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fbd0;->a:Ll/tbd0;

    iput-object p2, p0, Ll/fbd0;->b:Ll/dbd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fbd0;->a:Ll/tbd0;

    iget-object p0, p0, Ll/fbd0;->b:Ll/dbd0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/tbd0;->m0(Ll/tbd0;Ll/dbd0;Ljava/lang/Throwable;)V

    return-void
.end method
