Patching is done with the morphe CLI. It's cloned and already built at `/home/ben/repos/morphe-cli`

An example command for patching is as follows (from the root of this repo):
```
# replace $1 with your input apk if not using a bash script
java -Xms152m -jar /home/ben/repos/morphe-cli/build/libs/morphe-cli*-all.jar patch --patches ./build/libs/patches*.mpp --out ihealth-patched.apk $1 --install
```
`--install` will install to the first connected ADB device if none is specified