.class public final synthetic Ll/p8g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d9g;

.field public final synthetic b:Ll/ppq;


# direct methods
.method public synthetic constructor <init>(Ll/d9g;Ll/ppq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p8g;->a:Ll/d9g;

    iput-object p2, p0, Ll/p8g;->b:Ll/ppq;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p8g;->a:Ll/d9g;

    iget-object p0, p0, Ll/p8g;->b:Ll/ppq;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/d9g;->c4(Ll/d9g;Ll/ppq;Ljava/lang/Throwable;)V

    return-void
.end method
