.class public final synthetic Ll/gqg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sfg0;

.field public final synthetic b:Ljava/io/IOException;


# direct methods
.method public synthetic constructor <init>(Ll/sfg0;Ljava/io/IOException;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gqg0;->a:Ll/sfg0;

    iput-object p2, p0, Ll/gqg0;->b:Ljava/io/IOException;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gqg0;->a:Ll/sfg0;

    iget-object p0, p0, Ll/gqg0;->b:Ljava/io/IOException;

    invoke-static {v0, p0}, Ll/usg0;->c(Ll/sfg0;Ljava/io/IOException;)V

    return-void
.end method
