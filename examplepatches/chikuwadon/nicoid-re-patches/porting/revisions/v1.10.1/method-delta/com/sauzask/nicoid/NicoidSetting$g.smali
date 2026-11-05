.class public Lcom/sauzask/nicoid/NicoidSetting$g;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidSetting;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidSetting;


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 9

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidSetting$g;->a:Lcom/sauzask/nicoid/NicoidSetting;

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidSetting$g;->a:Lcom/sauzask/nicoid/NicoidSetting;

    const v1, 0x7f0f016b

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v0, Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidSetting$g;->a:Lcom/sauzask/nicoid/NicoidSetting;

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    const-string v1, "<style>div {padding:5; margin:5; background-color:#ddd;}</style>"

    const-string v2, "<b>Apache Commons Lang 3.1</b><br><div><code>This project is licensed under the Apache License v2.0.<br><br>You may obtain a copy of the License at<br><br><a href=\'http://www.apache.org/licenses/LICENSE-2.0\'>http://www.apache.org/licenses/LICENSE-2.0</a></code></div><br>"

    invoke-static {v1, v2}, Le/b/a/a/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "<b>PagerSlidingTabStrip</b><br><div><code>Copyright 2013 Andreas Stuetz<br><br>Licensed under the Apache License, Version 2.0 (the \"License\");<br>you may not use this file except in compliance with the License.<br>You may obtain a copy of the License at<br><br>   <a href=\'http://www.apache.org/licenses/LICENSE-2.0\'>http://www.apache.org/licenses/LICENSE-2.0</a><br><br>Unless required by applicable law or agreed to in writing, software<br>distributed under the License is distributed on an \"AS IS\" BASIS,<br>WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.<br>See the License for the specific language governing permissions and<br>limitations under the License.</code></div>"

    invoke-static {v1, v2}, Le/b/a/a/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v2, 0x0

    const-string v4, "text/html"

    const-string v5, "UTF-8"

    const/4 v6, 0x0

    move-object v1, v0

    invoke-static/range {v1 .. v6}, Le/e/a/LicenseTheme;->load(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidSetting$g;->a:Lcom/sauzask/nicoid/NicoidSetting;

    const v1, 0x7f0f0036

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/sauzask/nicoid/NicoidSetting$g$a;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidSetting$g$a;-><init>(Lcom/sauzask/nicoid/NicoidSetting$g;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return v0
.end method
