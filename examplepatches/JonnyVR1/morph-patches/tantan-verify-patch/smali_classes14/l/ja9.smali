.class public final synthetic Ll/ja9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qa9;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/qa9;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ja9;->a:Ll/qa9;

    iput-object p2, p0, Ll/ja9;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ja9;->a:Ll/qa9;

    iget-object p0, p0, Ll/ja9;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/qa9;->i3(Ll/qa9;Ljava/lang/String;)V

    return-void
.end method
