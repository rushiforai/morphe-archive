.class public final synthetic Ll/lig0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/apg0;

.field public final synthetic b:Ljava/io/IOException;


# direct methods
.method public synthetic constructor <init>(Ll/apg0;Ljava/io/IOException;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lig0;->a:Ll/apg0;

    iput-object p2, p0, Ll/lig0;->b:Ljava/io/IOException;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lig0;->a:Ll/apg0;

    iget-object p0, p0, Ll/lig0;->b:Ljava/io/IOException;

    invoke-static {v0, p0}, Ll/ulg0;->b(Ll/apg0;Ljava/io/IOException;)V

    return-void
.end method
