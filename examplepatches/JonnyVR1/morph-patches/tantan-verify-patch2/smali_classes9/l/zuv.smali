.class public final synthetic Ll/zuv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/mvv;

.field public final synthetic b:Ll/xl2$b;


# direct methods
.method public synthetic constructor <init>(Ll/mvv;Ll/xl2$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zuv;->a:Ll/mvv;

    iput-object p2, p0, Ll/zuv;->b:Ll/xl2$b;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zuv;->a:Ll/mvv;

    iget-object p0, p0, Ll/zuv;->b:Ll/xl2$b;

    invoke-static {v0, p0}, Ll/mvv;->O4(Ll/mvv;Ll/xl2$b;)V

    return-void
.end method
